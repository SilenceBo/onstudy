package com.xawl.study.model;

public class StudentVo extends Student {
	private StudentWork work;
	private boolean isSubmitWork;

	public boolean isSubmitWork() {
		return isSubmitWork;
	}

	public void setSubmitWork(boolean isSubmitWork) {
		this.isSubmitWork = isSubmitWork;
	}

	public StudentWork getWork() {
		return work;
	}

	public void setWork(StudentWork work) {
		this.work = work;
	}

	@Override
	public String toString() {
		return "StudentVo [work=" + work + ", isSubmitWork=" + isSubmitWork
				+ "]";
	}

}
