package _00_init.util;

import java.util.ArrayList;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan({"iiiNews","franktest","_00_init"})
public class WebAppConfig implements WebMvcConfigurer {

	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource resource =new ResourceBundleMessageSource();
		resource.setBasename("messages");
		return resource;
	}
	
//	@Override 
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//	 registry.addResourceHandler("/css/**").
//	 addResourceLocations("/WEB-INF/views/css/");
//	 registry.addResourceHandler("/image/**")
//	 .addResourceLocations("/WEB-INF/views/images/"); }

	@Bean
	public CommonsMultipartResolver multipartResolver() { 
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}	
	@Bean 
	public MappingJackson2JsonView jsonView() {
	    MappingJackson2JsonView view = new MappingJackson2JsonView();
	    view.setPrettyPrint(true);
	    return view;
	}

	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
	    ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
	    resolver.setContentNegotiationManager(manager);
	    ArrayList<View> views = new ArrayList<>();
	    views.add(jsonView());
	    resolver.setDefaultViews(views);
	    return resolver;
	}

	  @Override 
	  public void
	 configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	 configurer.enable(); }
}	
//	 
//}
