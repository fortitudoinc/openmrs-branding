<%
 ui.decorateWith("appui", "standardEmrPage")
%>



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
        { label: "View Files"}
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

<img id="preview-image" src="${ ui.resourceLink("document", "images/Logo3.png") }" style="max-width: 50px; max-height: 50px;">
</br></br></br></br>
<img id="preview-image" src="${ ui.resourceLink("document", "images/Logo3.png") }">


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




