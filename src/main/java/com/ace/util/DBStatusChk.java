package com.ace.util;

import java.sql.Connection;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DBStatusChk {
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	@Resource(name="session_back")
	private SqlSession sqlSession_back;
	
	//DB접속여부 테스트 클래스
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;
	@Resource(name="sqlSessionFactory_back")
	private SqlSessionFactory sqlSessionFactory_back;
	
	@Resource(name="dataSource_back")
	private DataSource dataSource_back;
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	
	
	public boolean mainDBConnTest() throws Exception {
		//true : 접속가능, false : 접속불가
		boolean chk = false;
		try{

			sqlSession = sqlSessionFactory.openSession();
			Connection conn = dataSource.getConnection();

			if(conn != null) {
				chk = true;
			}else {
				chk = false;
			}

		}catch(Exception e) {			
			e.printStackTrace();
		}
		return chk;
	}
	
	public boolean backDBConnTest() {
		//true : 접속가능, false : 접속불가
		boolean chk = false;
		try{

			sqlSession_back = sqlSessionFactory_back.openSession();
			Connection conn_back = dataSource_back.getConnection();

			if(conn_back != null) {
				chk = true;
			}else {
				chk = false;
			}

		}catch(Exception e) {			
			e.printStackTrace();
		}
		return chk;
	}	
}
