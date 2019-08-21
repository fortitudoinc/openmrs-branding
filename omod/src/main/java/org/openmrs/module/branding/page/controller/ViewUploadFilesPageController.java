/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.branding.page.controller;

import java.io.File;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.openmrs.util.OpenmrsUtil;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author levine
 */
public class ViewUploadFilesPageController {
	
	public void controller(HttpServletRequest request, @RequestParam(value = "file", required = false) String fileName,
	        @RequestParam(value = "patientId", required = false) Patient patient, PageModel pageModel,
	        PageRequest pageRequest) {
		
	}
	
}
