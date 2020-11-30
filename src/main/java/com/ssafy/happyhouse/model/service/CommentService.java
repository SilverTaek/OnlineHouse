package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.CommentDto;



public interface CommentService {
	public List<CommentDto> selectAllCBoard(int qno);
	public CommentDto detailCBoard(int cno);
	public boolean writeCBoard(CommentDto comment);
	public boolean updateCBoard(CommentDto comment);
	public boolean deleteCBoard(int cno);
}
