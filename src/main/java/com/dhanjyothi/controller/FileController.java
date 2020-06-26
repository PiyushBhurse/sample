package com.dhanjyothi.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dhanjyothi.util.GlobalConstants;

@RestController
public class FileController {

	@RequestMapping(value = "/download/kyc")
	public void fileDownloadPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = ServletRequestUtils.getStringParameter(request, "filePath", "");
		File file = new File(GlobalConstants.FILE_LOCATION + fileName);
		if (file.exists()) {

			String mimeType = URLConnection.guessContentTypeFromName("");
			if (mimeType == null) {
				mimeType = "application/octet-stream";
			}
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));
			response.setContentLength((int) file.length());
			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
			FileCopyUtils.copy(inputStream, response.getOutputStream());

		}
	}
}
