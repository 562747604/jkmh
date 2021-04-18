package org.soft.erp.controller;

import org.apache.log4j.Logger;
import org.soft.erp.service.BaseService;
import org.soft.erp.service.jggly.RyfpService;
import org.soft.erp.service.jggly.UserService;
import org.soft.erp.service.jkzj.PgywService;
import org.soft.erp.service.sys.ColumnService;
import org.soft.erp.service.sys.OrganService;
import org.soft.erp.service.sys.SfieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

/**
 * @Description: 超级管理员 <br>
 *               ：
 * @author 
 * @version V1.0
 */

@Controller
public class BaseController {
	private static Logger logger = Logger.getLogger(BaseController.class);
	@Autowired
	@Qualifier("columnService")
	public ColumnService columnService;
		
	@Autowired
	@Qualifier("userService")
	public UserService userService;


	@Autowired
	@Qualifier("sfieldService")
	public SfieldService sfieldService;
	
	@Autowired
	@Qualifier("baseService")
	public BaseService baseService;
	
	@Autowired
	@Qualifier("organService")
	public OrganService organService;
	
	@Autowired
	@Qualifier("pgywService")
	public PgywService pgywService;
	
	@Autowired
	@Qualifier("ryfpService")
	public RyfpService ryfpService;
	
	
}
