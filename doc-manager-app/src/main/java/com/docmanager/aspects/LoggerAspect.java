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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * User: pserra
 * Date: 18-11-2013
 */
@Component
@Aspect
public class LoggerAspect {

    private final static String FORMAT_LOG_STR = "%s - %s @ TARGET: (%s) %s.%s";

    private final Logger log = LoggerFactory.getLogger("LOG");



    @Before("execution(public * com.docmanager.controller..*.*(..))")
    public void logMethodCall(JoinPoint joinPoint) throws Throwable{

        ServletRequestAttributes t = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();

        String logStr = String.format(FORMAT_LOG_STR,
                t.getRequest().getRemoteUser(),
                t.getRequest().getRequestedSessionId(),
                t.getRequest().getMethod(),
                joinPoint.getTarget().getClass().getName(),
                joinPoint.getSignature().getName());

        log.info(logStr);
    }

}
