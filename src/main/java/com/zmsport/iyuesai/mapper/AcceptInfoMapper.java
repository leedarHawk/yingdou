package com.zmsport.iyuesai.mapper;

import java.util.List;

/**
 * 约战申请信息mapper
 * @author bilei
 *
 */
public interface AcceptInfoMapper {

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
	 * 获取申请
	 * @param challengeId
	 * @param tid
	 * @return
	 */
	public AcceptInfo findAcceptInfoBycIdAndTid(long challengeId, int tid);
}
