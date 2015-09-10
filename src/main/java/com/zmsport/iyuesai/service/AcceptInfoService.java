package com.zmsport.iyuesai.service;

import java.util.List;
import com.zmsport.iyuesai.mapper.AcceptInfo;

/**
 * 约战申请信息service
 * @author bilei
 *
 */
public interface AcceptInfoService {

	/**
	 * 获取约战申请信息
	 * @param challengeId
	 * @return
	 */
	public List<AcceptInfo> findAcceptInfoByChallengeId(long challengeId);
	
	/**
	 * 插入
	 * @param ai
	 */
	public void insert(AcceptInfo ai);
	
	/**
	 * 是否已经申请
	 * @param challengeId
	 * @param tid
	 * @return
	 */
	public boolean isAccept(long challengeId, int tid);
}
