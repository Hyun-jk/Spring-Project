package kr.spring.movie.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.ExecuteException;
import org.apache.commons.exec.PumpStreamHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.movie.vo.CinemaVO;

@Controller
public class CinemaController {

   @RequestMapping("/movie/boxoffice.do")
   public String box(Model model) throws ExecuteException, IOException{
      String[] command = new String[2];
      command[0] = "python";
      command[1] = "C:\\Users\\tnvdm\\git\\movieProject\\springProject\\src\\main\\java\\kr\\spring\\movie\\controller\\cinema.py";
      CommandLine commandLine = CommandLine.parse(command[0]);
      for (int i = 1, n = command.length; i < n; i++) {
         commandLine.addArgument(command[i]);
      }

      ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
      PumpStreamHandler pumpStreamHandler = new PumpStreamHandler(outputStream);
      DefaultExecutor executor = new DefaultExecutor();
      executor.setStreamHandler(pumpStreamHandler);
      int result = executor.execute(commandLine);
      System.out.println(result);
      System.out.println(outputStream.toString());

      //줄바꿈을 구분자로 처리
      String[] lines = outputStream.toString().split("\\r?\\n");
      
      List<CinemaVO> list = new ArrayList<CinemaVO>();
      for(int i=0;i<lines.length;i++) {
         String[] item = lines[i].split("\\^");
         CinemaVO vo = new CinemaVO();
         vo.setUrl(item[0]);
         vo.setTitle(item[1]);
         
         vo.setCount(item[2]);
         list.add(vo);
         System.out.println(vo);
      }
      
      model.addAttribute("count", lines.length);
      model.addAttribute("list", list);
      
      return "boxoffice";
   }
}