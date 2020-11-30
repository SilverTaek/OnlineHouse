package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CommentDto;
import com.ssafy.happyhouse.model.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<CommentDto> selectAllCBoard(int qno) {
		// TODO Auto-generated method stub
		return commentMapper.selectCBoard(qno);
	}

	@Override
	public CommentDto detailCBoard(int cno) {
		// TODO Auto-generated method stub
		return commentMapper.selectCBoardByNo(cno);
	}

	@Override
	public boolean writeCBoard(CommentDto comment) {
		// TODO Auto-generated method stub
		return commentMapper.insertCBoard(comment)==1;
	}

	@Override
	public boolean updateCBoard(CommentDto comment) {
		// TODO Auto-generated method stub
		return commentMapper.updateCBoard(comment)==1;
	}

	@Override
	public boolean deleteCBoard(int cno) {
		// TODO Auto-generated method stub
		return commentMapper.deleteCBoard(cno)==1;
	}

}
