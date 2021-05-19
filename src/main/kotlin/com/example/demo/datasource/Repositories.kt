package com.example.demo.datasource

import com.example.demo.model.Task
import org.springframework.stereotype.Repository

interface TaskRepository {
    fun getAllTasks(): Collection<Task>
    fun deleteTask(id: Int): Task
    fun updateTask(task: Task, id: Int): Task
    fun getTaskDetails(id: Int): Task
    fun addTask(task: Task): Task
}

@Repository
class TaskDataSource : TaskRepository {

    var tasks = listOf(
            Task(id = 1, text = "First Task", day = "21.02.12", reminder = false),
            Task(id = 2, text = "Second Task", day = "22.02.12", reminder = false),
            Task(id = 3, text = "Third Task", day = "23.02.12", reminder = false),
            Task(id = 4, text = "Forth Task", day = "24.02.12", reminder = false)
    )

    override fun getAllTasks(): Collection<Task> {
        return tasks
    }

    override fun deleteTask(id: Int): Task {
        val task = getTaskDetails(id)
        val newTasks = tasks.toMutableList().apply {
            removeIf { it.id == id }
        }
        tasks = newTasks
        return task
    }

    override fun updateTask(task: Task, id: Int): Task {
        tasks.map {
            if (it.id == id) {
                it.reminder = task.reminder
            }
        }
        return getTaskDetails(task.id)
    }

    override fun getTaskDetails(id: Int): Task {
        return tasks.firstOrNull {
            it.id == id
        } ?: throw NoSuchElementException("Could not find your hello world")
    }

    override fun addTask(task: Task): Task {
        val newTasks = tasks.toMutableList().apply {
            task.id = tasks.size + 1
            add(task)
        }
        tasks = newTasks
        return task
    }

}