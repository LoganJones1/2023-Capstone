import subprocess
from subprocess import check_output
import rospy
import shlex
import sys
import signal
import psutil

#i think we should reference this code

def kill_child_processes(parent_pid, sig=signal.SIGTERM):
    try:
        parent = psutil.Process(parent_pid)
        print(parent)
    except psutil.NoSuchProcess:
        print("parent process not existing")
        return
    children = parent.children(recursive=True)
    print(children)
    for process in children:
        print("try to kill child: " + str(process))
        process.send_signal(sig)

class Roscore(object):
    """
    roscore wrapped into a subprocess.
    Singleton implementation prevents from creating more than one instance.
    """
    __initialized = False
    def __init__(self):
        if Roscore.__initialized:
            raise Exception("You can't create more than 1 instance of Roscore.")
        Roscore.__initialized = True
    def run(self):
        try:
            self.roscore_process = subprocess.Popen(['roscore'])
            self.roscore_pid = self.roscore_process.pid  # pid of the roscore process (which has child processes)
            print('pid = ', self.roscore_pid);
        except OSError as e:
            sys.stderr.write('roscore could not be run')
            raise e
    def terminate(self):
        self.roscore_pid = rospy.get_master().getPid()
        print("try to kill child pids of roscore pid: " + str(self.roscore_pid[2]))
        kill_child_processes(self.roscore_pid[2])
        #self.roscore_process.terminate()
        # self.roscore_process.wait(10)  # important to prevent from zombie process
        Roscore.__initialized = False
