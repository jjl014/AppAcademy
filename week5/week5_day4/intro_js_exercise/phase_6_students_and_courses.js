function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function name() {
  return `${this.firstName} ${this.lastName}`;
};

Student.prototype.enroll = function enroll(course) {
  if (this.hasConflict(course)) {
    throw `Already enrolled in ${course.courseName} or time conflict with current courses.`;
  } else {
    this.courses.push(course);
    course.students.push  (this);
  }
};

Student.prototype.hasConflict = function hasConflict(course) {
  let conflict = false;
  this.courses.forEach( (crse) => {
    if (crse.conflictsWith(course)) conflict = true;
  });
  return conflict;
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

let jimmy = new Student("Jimmy", "Li");
let leia = new Student("Leia", "Mae");
let peter = new Student("Peter", "L");
let brian = new Student("Brian", "Sohn");
let jerry = new Student("Jerry", "Lau");

let english = new Course("English 101", "English", 4, 2, ['Mon', 'Wed', 'Fri']);
let math = new Course("Math 101", "Math", 4, 4, ['Mon', 'Wed', 'Fri']);
let math2 = new Course("Math 102", "Math", 4, 4, [ 'Wed', 'Fri']);
let cs = new Course("CS 101", "CS", 4, 6, ['Tues', 'Thur']);
let art = new Course("Art 101", "Art", 4, 2, ['Wed']);
let science = new Course("Science 101", "Science", 4, 4, ['Fri']);
