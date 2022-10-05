    
import platform
import sys
import time
import numpy as np

    
from classes import Agent, Composition, ID_START

class Gingerbread(Composition):
    def __init__(self, BPM=60):
        Composition.__init__(self,BPM=BPM)
        self.min=-3
        self.max=8
        self.range=self.max-self.min 
        # your code here
        self.x = -0.1
        self.y = 0.1
        
    def map(self, value_in, min_out, max_out):
        value_out = (value_in-self.min)/(self.range)
        value_out = min_out+ value_out * (max_out-min_out)
        return np.clip(value_out, min_out, max_out)

    def next(self):
        # your code here
        x_new = 1 - self.y - np.abs(self.x)
        self.y = self.x
        self.x = x_new
        self.midinote = int(self.map(self.x, 30, 70))
        self.dur = self.map(self.y, 0.3, 2)


        
        
    
if __name__=="__main__":
    n_agents=1
    composer=Gingerbread()
    agents=[_ for _ in range(n_agents)]
    agents[0] = Agent(57120, "/note_effect", composer)

    input("Press any key to start \n")
    for agent in agents:
        agent.start()
    try: # USE CTRL+C to exit     
        while True:
            time.sleep(10)
    except:         
        for agent in agents:              
            agent.kill()
            agent.join()
        sys.exit()

# %%