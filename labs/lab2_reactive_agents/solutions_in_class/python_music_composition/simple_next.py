import sys
import time

from classes import Agent, Composition, ID_START, check_some_agent_running

class Simple_Next(Composition):

    def __init__(self, BPM=120):
        Composition.__init__(self,BPM=BPM)    
        self.nodeId = 60
        self.direction = -1
            
    def next(self):
        if self.id == ID_START:
            self.id = 0
            self.midinote = self.nodeId
            self.dur = 1
            self.amp = 1

        if self.nodeId == 60 or self.nodeId == 84:
            self.direction *= -1

        self.midinote = self.nodeId
        self.nodeId += self.direction
        if self.midinote==62:
            self.stop()


if __name__=="__main__":
    n_agents=1
    composer=Simple_Next()
    agents=[_ for _ in range(n_agents)]
    agents[0] = Agent(57120, "/note_effect", composer)

    input("Press any key to start \n")
    for agent in agents:
        agent.start()
    try: # USE CTRL+C to exit     
        while check_some_agent_running(agents):
            time.sleep(10)
    except:   
        pass      
    for agent in agents:              
        agent.kill()
        agent.join()
    sys.exit()

# %%