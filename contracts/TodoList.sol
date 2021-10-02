// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract TodoList {
    uint public countTask = 0;
    mapping (uint => Task) public tasks;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    constructor() public{
        createTask("loading...");
    }

    event taskCreated (
        uint id,
        string content,
        bool completed
    );

    event taskCompleted (
        uint id,
        bool completed
    );


    function createTask(string memory _content) public {
        countTask++;
        tasks[countTask] = Task(countTask, _content, false);
        emit taskCreated(countTask, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit taskCompleted(_id, _task.completed);
    }
}