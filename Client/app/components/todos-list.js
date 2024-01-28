import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { inject as service } from '@ember/service';

export default class TaskListComponent extends Component {
  @service('task') taskService;

  @tracked title = '';
  @tracked description = '';
  @tracked status = '';
  @tracked dueDate = '';
  @tracked tasks = [];

  constructor() {
    super(...arguments);
    this.initTasks();
  }

  async initTasks() {
    this.tasks = [
      {
        title: 'Sample Task 1',
        description: 'This is a sample task description.',
        status: 'To Do',
        dueDate: '2024-01-28T12:00', // Use a valid date format
      },
      {
        title: 'Sample Task 2',
        description: 'Another sample task description.',
        status: 'In Progress',
        dueDate: '2024-01-29T14:30',
      },
    ];

    if (this.taskService) {
      await this.taskService.fetchTasks();
      this.tasks = this.tasks.concat(this.taskService.tasks);
    } else {
      console.warn('taskService not available in TaskListComponent');
    }
  }

  @action
  updateTitle(event) {
    this.title = event.target.value;
  }

  @action
  updateDescription(event) {
    this.description = event.target.value;
  }

  @action
  updateStatus(event) {
    this.status = event.target.value;
  }

  @action
  updateDueDate(event) {
    this.dueDate = event.target.value;
  }

  @action
  addTaskLocally() {
    const newTask = {
      title: this.title,
      description: this.description,
      status: this.status,
      dueDate: this.dueDate,
    };

    this.tasks = [...this.tasks, newTask];
    this.title = '';
    this.description = '';
    this.status = '';
    this.dueDate = '';
  }

  @action
  async addTask() {
    console.log('this.taskService:', this.taskService);
    console.log('typeof this.taskService.createTask:', typeof this.taskService.createTask);

    const newTask = {
      title: this.title,
      description: this.description,
      status: this.status,
      dueDate: this.dueDate,
    };
    this.addTaskLocally(newTask);

    if (this.taskService && typeof this.taskService.createTask === 'function') {
      await this.taskService.createTask(newTask);
    } else {
      console.error('taskService or createTask is not defined');
    }
  }

  @action
  async handleDelete(task) {
    this.tasks = this.tasks.filter((t) => t !== task);
    await this.taskService.deleteTask(task);
  }
}
