package pl.kozhanov.ProjectManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.kozhanov.ProjectManagementSystem.service.ProjectService;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    ProjectService projectService;


    @PostMapping("/addNew")
    @ResponseBody
    public String addNewComment(
            @RequestParam("id") Integer projectId,
            @RequestParam("commentText") String commentText) {
        projectService.addNewComment(projectId, commentText);
        return "Comment added!";
    }

}
