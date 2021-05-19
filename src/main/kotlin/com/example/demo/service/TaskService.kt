package com.example.demo.service

import com.example.demo.datasource.TaskDataSource
import com.example.demo.model.Task
import org.springframework.stereotype.Service

@Service
class TaskService(private val dataSource: TaskDataSource) {

    fun getAllTasks(): Collection<Task> {
        return dataSource.getAllTasks()
    }

    fun deleteTask(id: Int): Task {
        return dataSource.deleteTask(id)
    }

    fun updateTask(task: Task, id: Int): Task {
        return dataSource.updateTask(task, id)
    }

    fun getTaskDetails(id: Int): Task {
        return dataSource.getTaskDetails(id)
    }

    fun addTask(task: Task): Task {
        return dataSource.addTask(task)
    }

}