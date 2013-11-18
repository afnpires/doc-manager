package com.docmanager.aspects;

import org.apache.commons.lang.time.StopWatch;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.impl.Log4JLogger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * User: pserra
 * Date: 18-11-2013
 */
@Component
@Aspect
public class LoggerAspect {

    private final Log log = LogFactory.getLog(this.getClass());

    @Before("execution(public * com.docmanager.controller..*.*(..)")
    public void logMethodCall(JoinPoint joinPoint) throws Throwable{
        log.info("[POINTCUT RUNNING]");
    }

}
