package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDto> list() throws SQLException {
		
		return sqlSession.getMapper(BoardMapper.class).list();
	}

	@Override
	public void write(BoardDto board) throws SQLException {
		sqlSession.getMapper(BoardMapper.class).write(board);
		
	}

	@Override
	public BoardDto view(int bno) throws SQLException {
	
		return sqlSession.getMapper(BoardMapper.class).view(bno);
	}

	@Override
	public void modify(BoardDto board) throws SQLException {
		sqlSession.getMapper(BoardMapper.class).modify(board);
		
	}

	@Override
	public void delete(int bno) throws SQLException {
		sqlSession.getMapper(BoardMapper.class).delete(bno);
		
	}

	@Override
	public int count() throws SQLException {
		
		return sqlSession.getMapper(BoardMapper.class).count();
	}

	@Override
	public List<BoardDto> listPage(int displayPost, int postNum) throws SQLException {
		
		return sqlSession.getMapper(BoardMapper.class).listPage(displayPost, postNum);
	}

}
