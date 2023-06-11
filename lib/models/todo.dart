class Todo {
  late String topic;
  late String description;

  Todo(this.topic, this.description);

  Todo clone() => Todo(topic, description);
}
