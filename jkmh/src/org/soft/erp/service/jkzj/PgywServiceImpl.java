package org.soft.erp.service.jkzj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.sql.Result;

import org.soft.erp.dao.jkzj.PgywDao;
import org.soft.erp.domain.jggly.Ryfp;
import org.soft.erp.domain.jkzj.StatInfo;
import org.soft.erp.util.common.ExcelUtils;
import org.soft.erp.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("pgywService")
public class PgywServiceImpl implements PgywService {
	@Autowired
	private PgywDao pgywDao;

//	public List getGuideDatas(String uid) throws Exception {
//
//		Report report = JSON.parseObject(HttpReport.getExamReport(), Report.class);
//
//		List<Content> listContent = null;
//		String strGuideDatas = report.getGuideDatas().toString();
//		List<GuideDatas> listGuideDatas = (List<GuideDatas>) JSON.parseObject(strGuideDatas, ArrayList.class);
//		 System.out.println("listGuideDatas===="+listGuideDatas);
//
//		for (int i = 0; i < listGuideDatas.size(); i++) {
//			String gdStr = listGuideDatas.get(i) + "";
//			// System.out.println(gdStr);
//			GuideDatas gt = JSON.parseObject(gdStr, GuideDatas.class);
//			System.out.println(gt.getName());
//			listContent = (List<Content>) JSON.parseObject(gt.getContent(),ArrayList.class);
//
//			 for (int j = 0; j < listContent.size(); j++) {
//			 String lc = listContent.get(j) + "";
//			 Content content = JSON.parseObject(lc, Content.class);
//			 System.out.println(content.getContent());
//			 }
//
//		}
//
//		return listContent;
//	}
//
//	public List getHealthDatas(String uid) throws Exception {
//
//		Report report = JSON.parseObject(HttpReport.getExamReport(), Report.class);
//
//		List<Item> listItem = null;
//		// List<EpidemicSurvey> listEpidemicSurvey = null;
//
//		HealthDatas healthDatas = report.getHealthDatas();
//
//		HealthAssess healthAssess = healthDatas.getHealthAssess();
//		// set healthAssess
//
//		List<EpidemicSurvey> listEpidemicSurvey = healthAssess.getEpidemicSurvey();
//		// set listEpidemicSurvey
//
//		return listItem;
//	}

	@Override
	public void updatePgyw(Ryfp bean) {
		pgywDao.update(bean);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Ryfp> selectPgyw(PageModel pageModel) {
		/** 当前需要分页的总数据条数 */
		Map<String, Object> params = new HashMap<>();
		params.put("pageModel", pageModel);

		// 根据prams取得所有数据
		int recordCount = pgywDao.count(params);
		pageModel.setRecordCount(recordCount);
		List<Ryfp> beans = pgywDao.select(params);

		return beans;
	}

	@Override
	public void updateJkzj(String id, String zjid, String zjname,String zc) {
		pgywDao.updateJkzj(id, zjid, zjname,zc);
	}
	@Override
	public void updateJkzj1(String id, String zyid, String zyname,String zc) {
		pgywDao.updateJkzj1(id, zyid, zyname,zc);
	}
	@Override
	public void updateJkzjzt(String id) {
		pgywDao.updateJkzjzt(id);
	}

	@Override
	public void addFc(String id, String zjid, String zjname, Result rs) {
		pgywDao.addFc(id, zjid, zjname, rs);
	}

//	// 阳性统计
//	public List<StatInfo> getCompanyStatsinfo(YxtjCondition yc) throws Exception {
//
//		//初始化搜索条件
//		String orgId ="21e0db9b-38c8-4f5a-9f0d-bcf5f6f55fc0";
//		String rank =(yc.getRank()==null||yc.getRank().equals(""))?"10":yc.getRank();
//		String ageStartVal =(yc.getAgeStartVal()==null||yc.getAgeStartVal().equals(""))?"0":yc.getAgeStartVal();
//		String ageEndVal =(yc.getAgeEndVal()==null||yc.getAgeEndVal().equals(""))?"30":yc.getAgeEndVal();
//		String dateStartVal =(yc.getDateStartVal()==null||yc.getDateStartVal().equals(""))?"2013-01-01":yc.getDateStartVal();
//		String dateEndVal =(yc.getDateEndVal()==null||yc.getDateEndVal().equals(""))?"2017-01-01":yc.getDateEndVal();
//
//		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");
//		dateStartVal=format.parse(dateStartVal).getTime()+"";
//		dateEndVal=format.parse(dateEndVal).getTime()+"";
//
//		yc = new YxtjCondition(orgId, ageStartVal, ageEndVal,dateStartVal, dateEndVal, rank);
//		
//		
//		String companyStatsinfo = HttpUtils.getCompanyStatsinfo(yc);
////		StatsInfo statsInfo = JSON.parseObject(companyStatsinfo,StatsInfo.class);
////		List<StatInfo> statInfos = statsInfo.getStatInfo();
////
////		System.out.println("statInfos===" + statInfos.size());
//		return statInfos;
//	}

	class Yxtj {
		private String name;
		private String type;
		private int data[];

		public Yxtj() {
			super();
			// TODO Auto-generated constructor stub
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public int[] getData() {
			return data;
		}

		public void setData(int[] data) {
			this.data = data;
		}

		public Yxtj(String name, String type, int[] data) {
			super();
			this.name = name;
			this.type = type;
			this.data = data;
		}
	}

	public String getYxtjListJson(List<StatInfo> statInfo) {
		List<Yxtj> yxtjList = new ArrayList<Yxtj>();
		for (StatInfo si : statInfo) {
			Yxtj yxtj = new Yxtj();
			yxtj.setName(si.getConclusionName());
			yxtj.setType("bar");
			int s[] = { si.getTotalCount() };
			yxtj.setData(s);
			yxtjList.add(yxtj);
		}
		return JSON.toJSON(yxtjList) + "";
	}

	public String getYxtjLegendStr(List<StatInfo> statInfo) {
		List<String> legend = new ArrayList<String>();
		for (StatInfo si : statInfo) {
			legend.add(si.getConclusionName());
		}
		return JSON.toJSON(legend) + "";
	}

	public void exportYxtjExcel(String pathName,List<StatInfo> statInfoList) throws Exception{

		List<String> headList = new ArrayList<String>();
		List<String> dataList = new ArrayList<String>();
		
		{
			headList.add("病名称");
			headList.add("总数");
			headList.add("女总数");
			headList.add("女占比例");
			headList.add("男总数");
			headList.add("男占比例");
		}
		for(StatInfo statInfo:statInfoList){
			dataList.add(statInfo.getConclusionName());
			dataList.add(statInfo.getTotalCount()+"");
			dataList.add(statInfo.getFemaleCount()+"");
			dataList.add(statInfo.getFemaleRate());
			dataList.add(statInfo.getMaleCount()+"");
			dataList.add(statInfo.getMaleRate());
		}
		
		ExcelUtils.exportYxtjExcel(pathName,headList,dataList);

	}

	//根据机构和专员取得体检用户列表-已选择
	public List<Ryfp> selectByJgidAndZjid(String jgid,int zjid){
		return pgywDao.selectByJgidAndZjid(jgid,zjid);
	}

	//根据机构和专员取得体检用户列表-已审核
	public List<Ryfp> selectYshByJgidAndZjid(String jgid,int zjid){
		return pgywDao.selectYshByJgidAndZjid(jgid,zjid);
	}

	//根据机构和专员取得体检用户列表-已审核
	public List<Ryfp> selectYshByJgid(String jgid){
		return pgywDao.selectYshByJgid(jgid);
	}

}
