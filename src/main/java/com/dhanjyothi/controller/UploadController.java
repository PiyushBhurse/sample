package com.dhanjyothi.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.dhanjyothi.model.UploadFile;
import com.dhanjyothi.util.GlobalConstants;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLConnection;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UploadController {

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public ModelAndView showUpload() {

        return new ModelAndView("");

    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView fileUploadPage(UploadFile uploadFile) throws IOException {

        return new ModelAndView("");

    }

    @RequestMapping(value = "/download/kyc")
    public void fileDownloadPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fileName = ServletRequestUtils.getStringParameter(request, "filePath", "");
        File file = new File(GlobalConstants.FILE_LOCATION + fileName);
        if (file.exists()) {

            String mimeType = URLConnection.guessContentTypeFromName("");
            if (mimeType == null) {
                //unknown mimetype so set the mimetype to application/octet-stream
                mimeType = "application/octet-stream";
            }
            response.setContentType(mimeType);
            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));
            //Here we have mentioned it to show as attachment
            //response.setHeader("Content-Disposition", String.format("attachment; filename=\"" + file.getName() + "\""));
            response.setContentLength((int) file.length());
            InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
            FileCopyUtils.copy(inputStream, response.getOutputStream());

        }
    }
}
