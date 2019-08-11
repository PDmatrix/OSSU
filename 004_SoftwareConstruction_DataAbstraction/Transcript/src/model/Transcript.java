package model;

public class Transcript {
    // REQUIRES: course is valid, grade > 0
    // MODIFIES: this
    // EFFECTS: adds grade
    public void addGrade(String course, double grade){ }

    // REQUIRES: course is valid
    // EFFECTS: returns course name and grade
    public String getCourseAndGrade(String course){ return null; }

    // EFFECTS: printing transcript
    public void printTranscript(){ }

    // EFFECTS: returns GPA
    public double getGPA(){ return 0.0; }
}
