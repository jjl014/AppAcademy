function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function name() {
  return `${this.firstName} ${this.lastName}`;
};

Student.prototype.enroll = function enroll(course) {
  if (!this.courses.includes(course)) {
    this.courses.concat(course);
    course.students.concat(this);
  }
};


function Course(courseName, department, numCredits, timeBlock, daysOfWeek) {
  this.courseName = courseName;
  this.department = department;
  this.numCredits = numCredits;
  this.timeBlock = timeBlock;
  this.daysOfWeek = daysOfWeek;
  this.students = [];
}

Course.prototype.addStudent = function addStudent(student) {
  student.enroll(this);
};

Course.prototype.conflictsWith = function conflictsWith(course) {
  for( let i = 0; i < this.daysOfWeek.length; i++) {
    if (course.daysOfWeek.includes(this.daysOfWeek[i])
      && course.timeBlock === this.timeBlock) {
        return true;
      }
  }
  return false;
};
