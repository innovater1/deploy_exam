package com.example.service;

import com.example.dao.TodoDAO;
import com.example.domain.TodoVO;
import com.example.dto.TodoDTO;
import com.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
public enum TodoService { // 컴파일러 역활 대체
    INSTANCE;
    
    private TodoDAO todoDAO;
    private ModelMapper modelMapper;

    TodoService() {
        todoDAO = new TodoDAO();
        modelMapper = MapperUtil.INSTANCE.getInstance();
    }

    public void register(TodoDTO todoDTO) throws Exception { // 객체 생성 데이터 저장 까지 가능
        TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
        //System.out.println("todoVO : " + todoVO);
        log.info("todoVO : " + todoVO); // @Log4j2 사용 시 출력문
        //dao.insert(todoVO); // int를 반환하므로 이를 이용해서 예외처리도 가능
        todoDAO.insert(todoVO);
    }

    public List<TodoDTO> listAll() throws Exception {
        List<TodoVO> voList = todoDAO.selectAll();
        log.info("voList...");
        log.info(voList);
//        List<TodoDTO> dtoList = voList.stream()
//                .map(vo -> modelMapper.map(vo, TodoDTO.class))
//                .collect(Collectors.toList());

        List<TodoDTO> dtoList = new ArrayList<>();
        for (TodoVO vo : voList) { // VO를 DTO로 변환해서 반복
            dtoList.add(modelMapper.map(vo, TodoDTO.class));
        }
        return dtoList;
    }

    public TodoDTO get(Long tno) throws Exception {
        log.info("tno : " + tno);
        TodoVO todoVO = todoDAO.selectOne(tno);
        TodoDTO todoDTO = modelMapper.map(todoVO, TodoDTO.class);
        return todoDTO;
    }

    public void remove(Long tno) throws Exception {
        log.info("remove(Long tno)...");
        log.info("tno : " + tno);

        todoDAO.deleteOne(tno);
    }
    public void modify(TodoDTO todoDTO) throws Exception {
        log.info("modify(TodoDTO todoDTO)...");
        log.info("todoDTO : " + todoDTO);

        TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
        todoDAO.updateOne(todoVO);
    }
}
