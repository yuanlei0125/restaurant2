package com.j170502.cateringmange.util;

public class Test {
}
class ThreadA implements Runnable {
    private final static String INITVAL = "1";
    private String tempSingal="runSingal";
    public void run() {
        new ThreadA_1().start();
        new ThreadA_2().start();
    }

    public void exeThreadA() {
        synchronized (ThreadA.INITVAL) {
            for (int i = 0; i < 10; i++) {
                System.out.print(i);
            }
        }
    }

    public void exeThreadB() {
        synchronized (this) {
            for (int i = 0; i < 10; i++) {
                System.out.print(i);
            }
        }
    }
    final class ThreadA_1 extends Thread{
        public void run() {
            synchronized (ThreadA.INITVAL) {
                for (int i = 0; i < 100; i++) {
                    System.out.print(i+"\t");
                }
            }
        }
    }
    final class ThreadA_2 extends Thread{
        public void run() {
            synchronized (tempSingal) {
                for (int i = 0; i < 100; i++) {
                    System.out.print(i+"\t");
                }
            }
        }
    }
}

class ExeThreadTest{
    public static void main(String[] argv) {
        ThreadA  threadA=new ThreadA();
        Thread t2=new Thread(threadA);
        t2.start();
    }
}