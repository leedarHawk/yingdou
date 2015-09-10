package com.zmsport.iyuesai.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zmsport.iyuesai.mapper.AcceptInfo;
import com.zmsport.iyuesai.mapper.AcceptInfoMapper;

/**
 * 约战申请信息service实现
 * @author bilei
 *
 */
@Service
public class AcceptInfoServiceImpl implements AcceptInfoService {
	
	@Autowired
	private AcceptInfoMapper mapper;

	@Override
	public List<AcceptInfo> findAcceptInfoByChallengeId(long challengeId) {
		// TODO Auto-generated method stub
		return mapper.findAcceptInfoByChallengeId(challengeId);
	}

	@Override
	public void insert(AcceptInfo ai) {
		// TODO Auto-generated method stub
		mapper.insert(ai);
	}

	@Override
	public boolean isAccept(long challengeId, int tid) {
		// TODO Auto-generated method stub
		return mapper.findAcceptInfoBycIdAndTid(challengeId, tid) != null;
	}

}
