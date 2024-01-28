
import Model, { attr } from '@ember-data/model';

export default class TaskModel extends Model {
  @attr('string') title;
  @attr('string') description;
  @attr('string') status;
  @attr('date') dueDate;
}
