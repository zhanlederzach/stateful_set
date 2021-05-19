package com.example.demo

import com.example.demo.model.BaseResponse
import com.example.demo.model.Status
import com.example.demo.model.Task
import com.example.demo.service.TaskService
import org.springframework.web.bind.annotation.*

@CrossOrigin(origins = ["*"], allowedHeaders = ["*"])
@RestController
class HtmlController(
    private val serviceTask: TaskService
) {

    @GetMapping("/health")
    fun getHeath(): BaseResponse {
        return BaseResponse(status = Status.OK, code = 200)
    }

    @GetMapping("/tasks")
    fun getAllTasks(): Collection<Task> {
        return serviceTask.getAllTasks()
    }

    @GetMapping("/tasks/{id}")
    fun getTaskDetails(@PathVariable id: Int): Task {
        return serviceTask.getTaskDetails(id)
    }

    @DeleteMapping("/tasks/{id}")
    fun deleteTask(@PathVariable id: Int): Task {
        return serviceTask.deleteTask(id)
    }

    @PutMapping("/tasks/{id}")
    fun updateTask(@PathVariable id: Int, @RequestBody task: Task): Task {
        return serviceTask.updateTask(task, id)
    }

    @PostMapping("/tasks")
    fun addTask(@RequestBody task: Task): Task {
        return serviceTask.addTask(task)
    }
}