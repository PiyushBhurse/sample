package com.dhanjyothi;

import javax.servlet.http.HttpSessionListener;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@ServletComponentScan
@SpringBootApplication
public class DhanjyothiApplication extends SpringBootServletInitializer implements HttpSessionListener {

	public static void main(String[] args) {
		SpringApplication.run(DhanjyothiApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(DhanjyothiApplication.class);
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		return multipartResolver;
	}

	@Bean(name = "messageSource")
	public ResourceBundleMessageSource resourceBundleMessageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasename("labels");
		return messageSource;
	}
}
