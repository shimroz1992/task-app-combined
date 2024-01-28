
import Service from '@ember/service';
import { inject as service } from '@ember/service';
import fetch from 'fetch';

const API_BASE_URL = 'http://localhost:3000/api/v1';

export default class TaskService extends Service {
  @service store;

  async createTask(taskData) {
    try {
      const response = await fetch(`${API_BASE_URL}/tasks`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(taskData),
      });

      if (!response.ok) {
        throw new Error(`Failed to create task: ${response.statusText}`);
      }

      const createdTask = await response.json();
      
     
      this.store.pushPayload('task', {
        data: {
          type: 'task', 
          ...createdTask,
        },
      });
    } catch (error) {
      console.error('Error creating task:', error.message);
    }
  }

async fetchTasks() {
  try {
    const response = await fetch(`${API_BASE_URL}/tasks`);

    if (!response.ok) {
      throw new Error(`Failed to fetch tasks: ${response.statusText}`);
    }

    const tasks = await response.json();
    console.log('Fetched Tasks:', tasks);

    const tasksPayload = {
      data: tasks.map((task) => ({
        type: 'task',
        id: task.id,
        attributes: {
          title: task.title,
          description: task.description,
          status: task.status,
          dueDate: task.dueDate,
        },
      })),
    };

    console.log('Serializer being used:', this.store.serializerFor('application'));
    console.log(tasksPayload);

    this.store.pushPayload(tasksPayload);
  } catch (error) {
    console.error('Error fetching tasks:', error.message);
  }
}

}