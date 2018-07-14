package com.kcls.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcls.mapper.UserMapper;
import com.kcls.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;

	@Override
	public List<Map<String,Object>> checkUserNam() {
		
		return userMapper.checkUserNam();
	}

	@Override
	public void addUser(HashMap<String, Object> map) {
		
		userMapper.addUser(map);
	}

	@Override
	public List<Map<String, Object>> loginUser(HashMap<String, Object> map) {
		
		return userMapper.loginUser(map);
	}

	@Override
	public void addApply(HashMap<String, Object> map) {
		
		userMapper.addApply(map);
	}

	@Override
	public void addReceive(HashMap<String, Object> map) {
		
		userMapper.addReceive(map);
	}

	@Override
	public List<HashMap<String, Object>> queryReceive(HashMap<String, Object> map) {
		
		return userMapper.queryReceive(map);
	}

	@Override
	public List<HashMap<String, Object>> queryReceiveCount(HashMap<String, Object> map) {
		
		return userMapper.queryReceiveCount(map);
	}

	@Override
	public List<HashMap<String, Object>> detailReceive(HashMap<String, Object> map) {
		
		return userMapper.detailReceive(map);
	}
	
	@Override
	public List<HashMap<String, Object>> detailReceive1(HashMap<String, Object> map) {
		
		return userMapper.detailReceive1(map);
	}
	

	@Override
	public void addDraftApply(HashMap<String, Object> map) {
		
		userMapper.addDraftApply(map);
	}

	@Override
	public List<HashMap<String, Object>> queryReceive1(HashMap<String, Object> map) {
		
		return userMapper.queryReceive1(map);
	}

	@Override
	public List<HashMap<String, Object>> queryReceiveCount1(HashMap<String, Object> map) {
		
		return userMapper.queryReceiveCount1(map);
	}

	@Override
	public void delDraft(HashMap<String, Object> map) {
		
		userMapper.delDraft(map);
	}

	@Override
	public Integer checkApplyType(HashMap<String, Object> map) {
		
		return userMapper.checkApplyType(map);
	}

	@Override
	public void modApply(HashMap<String, Object> map) {
		
		userMapper.modApply(map);
	}
	
	@Override
	public void modApply1(HashMap<String, Object> map) {
		
		userMapper.modApply1(map);
	}

	@Override
	public List<HashMap<String, Object>> borrowRecordList(HashMap<String, Object> map) {
		
		return userMapper.borrowRecordList(map);
	}

	@Override
	public Integer borrowRecordListCount(HashMap<String, Object> map) {
		
		return userMapper.borrowRecordListCount(map);
	}

	@Override
	public List<HashMap<String, Object>> receive1RecordList(HashMap<String, Object> map) {
		
		return userMapper.receive1RecordList(map);
	}

	@Override
	public Integer receive1RecordListCount(HashMap<String, Object> map) {
		
		return userMapper.receive1RecordListCount(map);
	}



}
