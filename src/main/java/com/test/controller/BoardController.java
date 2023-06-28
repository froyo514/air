package com.test.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.test.domain.BoardAttachVO;
import com.test.domain.BoardVO;
import com.test.domain.Criteria;
import com.test.domain.PageDTO;
import com.test.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;
@Log4j2
@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Setter(onMethod_=@Autowired)
	private BoardService boardService;
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		for(BoardAttachVO attachVO : attachList) {
			try {
				Path file = Paths.get("C:\\upload\\"+attachVO.getUploadpath()+
						"\\" + attachVO.getUuid()+"_"+attachVO.getFilename());
				Files.deleteIfExists(file);
				if( Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attachVO.getUploadpath()+
							"\\s_" + attachVO.getUuid()+"_"+attachVO.getFilename());
					Files.delete(thumbNail);
					}
				} catch(Exception e) {
					log.error("delete file error" + e.getMessage());
				}
			}
	}
		
		@GetMapping("/register")
		public String registerForm() {
			return "/board/registerForm";
		}
		@GetMapping("/map")
		public String map() {
			return "/board/map";
		}
		@GetMapping("/sogae")
		public String sogae() {
			return "/board/sogae";
		}
		
		@PostMapping("/register")
		public String register(BoardVO vo, RedirectAttributes rttr) {
			boardService.register(vo);
			rttr.addFlashAttribute("result", vo.getBno());
			return "redirect:/board/list";
		}
		
		
//		  @GetMapping("/list")
//		public String List(Model model) { List<BoardVO> List =
//		  boardService.getList(); model.addAttribute("List", List); log.info(List);
//		  return "/board/List";
//		  
//		  }
		 
		 @GetMapping("/get")
		 public String get(@RequestParam("bno")Long bno,Criteria criteria, Model model) {
			 model.addAttribute("board", boardService.get(bno));
			 return "/board/get";
		 }
		 @GetMapping("/modify")
		 public String modify(@RequestParam("bno")Long bno, Criteria criteria ,Model model) {
			 model.addAttribute("board", boardService.get(bno));
			 return "/board/modify";
		 } 
		@PostMapping("/modify")
		public String modify(BoardVO board, Criteria criteria, RedirectAttributes rttr) {
			if(boardService.modify(board)) {
				rttr.addFlashAttribute("result","success"); 
			}
			rttr.addAttribute("pageNum",criteria.getPageNum());
			rttr.addAttribute("amount",criteria.getAmount());
			return "redirect:/board/list";
		}
		@PostMapping("/remove")
		public String remove(@RequestParam("bno") Long bno,Criteria criteria, 
				RedirectAttributes rttr) {
			List<BoardAttachVO> attachList = boardService.getAttachList(bno);
			if(boardService.remove(bno)) {
				deleteFiles(attachList);
				rttr.addFlashAttribute("result","success");
			}
			/*rttr.addAttribute("pageNum",criteria.getPageNum());
			rttr.addAttribute("amount",criteria.getAmount());
			return "redirect:/board/list"; */
			return "redirect:/board/list" + criteria.getListLink();
		
			}
		@GetMapping("/list")
		public String list(Criteria criteria, Model model) {
			List<BoardVO> list = boardService.getList(criteria);
			model.addAttribute("list",list);
			int total = boardService.getTotal(criteria);
			model.addAttribute("pageDTO", new PageDTO(criteria,total));
			log.info(list + "total:" + total);
			return "/board/list";
			
		}
		
		@GetMapping(value = "/getAttachList/{bno}",
				produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody 
		public ResponseEntity<List<BoardAttachVO>> getAttachList
				(@PathVariable("bno") Long bno){
				log.info("getAttachList" + bno);
				return new ResponseEntity<>(boardService.getAttachList(bno),HttpStatus.OK);
				
			}
		
		@GetMapping(value = "/getAttachListOnList",
				produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<String> getAttachListOnList(
				@RequestParam(value="list[]") List<Long> list) {
			log.info("getAttachListOnList" + list.stream().collect(Collectors.toList()));
			Map<Long, List<BoardAttachVO>> map = new HashMap<Long, List<BoardAttachVO>>();
			for (Long bno : list) {
				map.put(bno, boardService.getAttachList(bno));
		}
		String gson = new Gson().toJson(map, HashMap.class);
		return new ResponseEntity<>(gson, HttpStatus.OK);
		}
		
		
		
		
}		
