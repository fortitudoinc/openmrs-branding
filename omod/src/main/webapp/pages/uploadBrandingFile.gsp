<% ui.decorateWith("appui", "standardEmrPage") %>

<script type="text/javascript">
            //var OPENMRS_CONTEXT_PATH = 'openmrs';
            window.sessionContext = window.sessionContext || {
                locale: "en_GB"
            };
            window.translations = window.translations || {};
</script>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "Upload Branding File"}
    ];
</script>

<style>
    #progress-bar {
        margin: 8px;
        width: auto;
        background-color: lightgray;
    }

    #progress {
        width: 1%;
        height: 30px;
        background-color: green;
        text-align: center;
        color: white;
    }
</style>

<label for="file-input"><i>File name must be openmrslogo.jpg</i>:</label>
<input id="file-input" multiple type="file" accept=".jpg">

<button id="send">Send</button>

<div id="progress-bar">
    <div id="progress"></div>
</div>

<script>
    const sendButton = document.querySelector('#send');
    sendButton.addEventListener(
        'click',
        function (e) {
            console.log("Send button clicked");
            uploadFile();
        },
        false);

    const fileInput = document.querySelector('#file-input');

    function uploadFile() {
        if (fileInput.files.length != 1) {
            alert("Select a single file");
            jq('#file-input').val('');
            return;
        }
        file = fileInput.files[0];
        if (file.name.localeCompare("openmrslogo.jpg") != 0) {
            alert("Incorrect file name - should be openmrslogo.jpg");
            jq('#file-input').val('');
            return;
        }
        initUpload(file);
    }

    function initUpload(file) {
        var xhr = new XMLHttpRequest();
        var uri = "upload.form";
        xhr.open("POST", uri);
        xhr.overrideMimeType('text/plain; charset=x-user-defined-binary');

        xhr.upload.onprogress = function(e) {
            var percentComplete = Math.ceil((e.loaded / e.total) * 100);
            console.log(percentComplete);
            updateProgress(percentComplete);
        };

        xhr.onreadystatechange = function() {
            console.log("----- readyState changed -----");
            console.log("readyState :", xhr.readyState);
            console.log("Response :", xhr.responseText);
            if (xhr.readyState === 4) {
                console.log("Upload finish");
                location.reload();
            }
        };

        var formData = new FormData();
        var reader = new FileReader();
        reader.onload = (function (e) {
            var previewFile = e.target.result;
            formData.append("filename", file.name);
            formData.append("file", previewFile);
            xhr.send(formData);
        });
        reader.readAsDataURL(file);
    }

    var elem = document.getElementById("progress");

    function updateProgress(progress) {
        elem.style.width = progress + '%';
        elem.innerHTML = progress + '%';
    }

</script>


<script id="breadcrumb-template" type="text/template">
    <li>
        {{ if (!first) { }}
        <i class="icon-chevron-right link"></i>
        {{ } }}
        {{ if (!last && breadcrumb.link) { }}
        <a href="{{= breadcrumb.link }}">
        {{ } }}
        {{ if (breadcrumb.icon) { }}
        <i class="{{= breadcrumb.icon }} small"></i>
        {{ } }}
        {{ if (breadcrumb.label) { }}
        {{= breadcrumb.label }}
        {{ } }}
        {{ if (!last && breadcrumb.link) { }}
        </a>
        {{ } }}
    </li>
</script> 


<script type="text/javascript">
    jq(function() {
        emr.updateBreadcrumbs();
    });
</script>
