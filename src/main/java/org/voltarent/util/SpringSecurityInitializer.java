package org.voltarent.util;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * Created by kevmw on 19/10/2018.
 */
public class SpringSecurityInitializer extends AbstractSecurityWebApplicationInitializer {

//    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { AppConfig.class };
    }

//    @Override
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }

//    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }

}
