package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.BoardDto;

public interface BoardService {
	public List<BoardDto> list() throws SQLException;
	public void write(BoardDto board) throws SQLException;
	public BoardDto view(int bno) throws SQLException;
	public void modify(BoardDto board) throws SQLException;
	public void delete(int bno)throws SQLException;
	public int count()throws SQLException;
	public List<BoardDto> listPage(int displayPost, int postNum) throws SQLException;
}
