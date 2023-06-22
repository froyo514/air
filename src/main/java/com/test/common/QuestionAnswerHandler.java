package com.test.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j2;
@Log4j2
public class QuestionAnswerHandler implements TypeHandler<JsonObject>{

	@Override
	public void setParameter(PreparedStatement ps, int i, 
			JsonObject parameter, JdbcType jdbcType) throws SQLException {
		ps.setString(i,parameter.toString());
		
	}

	@Override
	public JsonObject getResult(ResultSet rs, String columnName) throws SQLException {
		String key = rs.getString(columnName);
		return getQuestionAnswer(key);
	}

	@Override
	public JsonObject getResult(ResultSet rs, int columnIndex) throws SQLException {
		String key = rs.getString(columnIndex);
		return getQuestionAnswer(key);
	}

	@Override
	public JsonObject getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String key = cs.getString(columnIndex);
		return getQuestionAnswer(key);
	}
	//[매우좋아한다, 좋아한다 , 보통이다 , 싫어한다 , 매우싫어한다]/[매우좋아한다]:[5]
	private JsonObject getQuestionAnswer(String key) {
		JsonObject retValue = new JsonObject();
		if (key == null || key.length() == 0) {
			return retValue;
		}
		key = key.replace("[", "");
		key = key.replace("]", "");
		String[] first = key.split("/");
		String[] options = first[0].split(",");
		String[] second = first [1].split(":");
		String[] option = second[0].split(",");
		List<String> optionList = Arrays.asList(second[0].split(","));
		List<String> countList = Arrays.asList(second[1].split(","));
		if (options.length == 1) {
			for (int i=0; i<option.length; i ++) {
				retValue.addProperty(optionList.get(i), countList.get(i));
			}
		}else {
			for (String item : options) {
				item = item.trim();
				int pos = optionList.indexOf(item);
				if (pos != -1) {
					retValue.addProperty(item, countList.get(pos));
				}else {
					retValue.addProperty(item,"0");
				}
			}
		
		}
		log.info(retValue);
		return retValue;
	}
	
}
