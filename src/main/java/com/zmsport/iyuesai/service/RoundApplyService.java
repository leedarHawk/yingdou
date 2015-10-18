package com.zmsport.iyuesai.service;

import java.util.List;
import java.util.Map;

import com.zmsport.iyuesai.mapper.RoundApply;

/**
 * 球局申请service
 * @author bilei
 *
 */
public interface RoundApplyService {

	/**
	 * 某球局所有申请
	 * @param rid
	 * @return
	 */
	public List<RoundApply> getAllRoundApplys(long rid);
	
	/**
	 * 获取球局申请信息
	 * @param id
	 * @return
	 */
	public RoundApply getRoundApplyById(long id);
	
	/**
	 * 获取某一球局是否已申请
	 * @param uid
	 * @param rid
	 * @return
	 */
	public boolean isApply(long uid, long rid);
	
	/**
	 * 申请
	 * @param ra
	 */
	public void insert(RoundApply ra);
	
	/**
	 * 更新状态
	 * @param status
	 * @param id
	 */
	public void updateStatus(int status, long id);
	
	/**
	 * 获取某用户的球局申请
	 * @param uid
	 * @return
	 */
	public List<RoundApply> getRoundApplyByUid(long uid);
	
	/**
	 * 获取我创建的球局中请求参加的总数
	 * @param uid
	 * @return
	 */
	public int getMyRoundApplyNum(long uid);

	public List<RoundApply> getRoundAllApplyDetail( long id) ;

}
