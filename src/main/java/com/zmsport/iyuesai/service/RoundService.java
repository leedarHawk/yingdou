package com.zmsport.iyuesai.service;

import java.util.List;
import com.zmsport.iyuesai.mapper.Round;

/**
 * 球局service
 * @author bilei
 *
 */
public interface RoundService {

	/**
	 * 所有球局
	 * @return
	 */
	public List<Round> getAllRounds(long uid);
	
	/**
	 * 所有球局
	 * @param uid
	 * @return
	 */
	public List<Round> getAllRoundsNew(long uid);
	
	/**
	 * 查询球局
	 * @param id
	 * @return
	 */
	public Round findRoundById(long id);
	
	/**
	 * 插入
	 * @param round
	 */
	public void insert(Round round);
	
	/**
	 * 更新球局队员数量
	 * @param id
	 */
	public void updateMembers(long id);
}
