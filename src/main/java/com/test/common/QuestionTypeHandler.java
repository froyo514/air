package com.test.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import com.test.domain.QuestionType;

public class QuestionTypeHandler implements TypeHandler<QuestionType> {

	@Override
	public void setParameter(PreparedStatement ps, int i, 
			QuestionType parameter, JdbcType jdbcType)throws SQLException {
		ps.setString(i,parameter.getKey());
	}

	@Override
	public QuestionType getResult(ResultSet rs, String columnName) throws SQLException {
		String key = rs.getString(columnName);
		return getQuestionType(key);
	}

	@Override
	public QuestionType getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String key = cs.getString(columnIndex);
		return getQuestionType(key);
	}
	@Override
	public QuestionType getResult(ResultSet rs, int columnIndex) throws SQLException {
		String key = rs.getString(columnIndex);
		return getQuestionType(key);
	}
	
	private QuestionType getQuestionType(String key) {
		QuestionType type =null;
		switch (key){
			case "RADIO":
				type = QuestionType.RADIO;
				break;
			case "SELECT":
				type = QuestionType.SELECT;
				break;
			case "ANSWER":
				type = QuestionType.ANSWER;
				break;
		}
		return type;
	}

	
	
}
