package com.ace.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.domain.Alarm;
import com.ace.domain.Temper;

@Repository
public class AnalysisDaoImpl implements AnalysisDao{

	
	@Resource(name="sessionSQLite")
	private SqlSession sessionSQLite;
	

	@Resource(name="session")
	private SqlSession sqlSession;
	
	
	@Override
	public List<Temper> historyTrendPenGroupList(Temper temper) {
		return sqlSession.selectList("temper.historyTrendPenGroupList", temper);
	}

	@Override
	public List<String> historyTrendPenGroupSelect() {
		return sqlSession.selectList("temper.historyTrendPenGroupSelect");
	}

	@Override
	public List<Temper> historyTrendPenGroupChart(Temper temper) {
		return sqlSession.selectList("temper.historyTrendPenGroupChart", temper);
	}

	@Override
	public String historyTrendPenGroupChartGroupName(Temper temper) {
		return sqlSession.selectOne("temper.historyTrendPenGroupChartGroupName",temper);
	}
	
    @Override
    public List<Alarm> alarmlist(Alarm alarm) {
    	return sessionSQLite.selectList("alarm.alarmlist",alarm);
    }
    
    @Override
    public List<Alarm> alarmlistOverview() {
    	return sessionSQLite.selectList("alarm.alarmlistOverview");
    }

	@Override
	public void penGroupPenAdd(Temper temper) {
		sqlSession.insert("temper.penGroupPenAdd", temper);
	}

	@Override
	public int getPenGroupPenCount(Temper temper) {
		return sqlSession.selectOne("temper.getPenGroupPenCount",temper);
	}
    

}
