from flask import Flask, render_template, redirect, url_for, request

from student import Student

students = []

app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def students_page():
    if request.method == "POST":
        new_student_id = request.form.get("student-id", "")
        new_student_first_name = request.form.get("first-name", "")
        new_student_last_name = request.form.get("last-name", "")

        new_student = Student(first_name=new_student_first_name, last_name=new_student_last_name,
                              student_id=new_student_id)
        students.append(new_student)

        return redirect(url_for("students_page"))
    else:
        return render_template("index.html", students=students)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
