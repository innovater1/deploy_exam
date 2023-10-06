package test.dao;

import com.example.dao.TodoDAO;
import com.example.domain.TodoVO;
import com.example.dto.TodoDTO;
import com.example.service.TodoService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

@Log4j2
public class TodoServiceTests {
    private TodoService todoService;

    @BeforeEach
    public void ready() {
        todoService = TodoService.INSTANCE;
    }
    @Test
    public void testRegister() throws Exception {
        TodoDTO todoDTO = TodoDTO.builder()
                .title("안녕하세요")
                .dueDate(LocalDate.now())
                .build();
        log.info("--------------------"); // 테스트 코드의 Log4j2 설정 확인
        log.info(todoDTO);
        todoService.register(todoDTO);
    }

    @Test
    public void testListAll() throws Exception { // 전체 출력
        List<TodoDTO> list = todoService.listAll();

        // 1) 람다와 스트링 이용해서 출력
        list.forEach(todoVO -> log.info(todoService));

        // 2) forEach 사용
        for (TodoDTO todoDTO : list) {
            log.info(todoDTO);
        }
    }
    @Test
    public void testSelectOne() throws Exception { // 개별 출력
        long tno = 5;
        TodoDTO todoDTO = todoService.get(6L);
        log.info(todoDTO);

        log.info(todoService.get(6L));
    }

    @Test
    public void testRemove() throws Exception {
        //
        long tno = 1L;
        log.info(todoService.get(tno));
        todoService.remove(2L);
        log.info(todoService.get(tno));
    }
    @Test
    public void testModify() throws Exception {
        long tno = 3L;
        log.info(todoService.get(tno));
        TodoDTO todoDTO = TodoDTO.builder()
                .tno(tno)
                .title("Update Sample Title...")
                .dueDate(LocalDate.of(2023, 12, 31))
                .build();
        todoService.modify(todoDTO);

    }
}
