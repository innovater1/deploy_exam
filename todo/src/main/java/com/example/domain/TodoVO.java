package com.example.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TodoVO { // Setter 미사용 경우
    private Long tno;
    private String title;
    private LocalDate dueDate;
    private boolean finished;
}
