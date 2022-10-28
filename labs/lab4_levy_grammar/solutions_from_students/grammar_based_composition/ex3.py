# %% Import libraries
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
from classes import Sonifier, Grammar_Sequence, metronome_grammar

# %%
ex3_grammar={
    "S":["M", "SM"],
    "M": [["H","H"], ["Q", "H", "Q"], ["th","th","th"]],    
    "H": [["h"], ["ph"], ["Q","Q"], ["O", "Q", "O"], ["tq","tq","tq"]],
    "Q": [["q"], ["pq"],["O","O"],["to","to","to"]],
    "O": [["o"], ["po"]]
}

ex3_word_dur={"h" :0.5, # half-measure
              "q": 0.25, # quarter-measure
              "o": 0.125,
              "ph": 0.5,
              "pq": 0.25,
              "po": 0.125,
              "th": 1/3,
              "tq": 0.5/3,
              "to": 0.25/3,

}


if __name__=="__main__":
    fn_out="ex3.wav"

    NUM_M=8
    START_SEQUENCE=["M",]*NUM_M
    G=Grammar_Sequence(ex3_grammar)        
        
    final_sequence, seqs=G.create_sequence(START_SEQUENCE)
    for seq in seqs:
        print(" ".join(seq))
    print(f"Final sequence: {' '.join(final_sequence)}")    
    
    S= Sonifier("sounds/cymb.wav", BPM=174, word_dur=ex3_word_dur)
    audio_array=S.create_audio(final_sequence, add_metronome=True)
    S.write("out/"+fn_out, audio_sequence=audio_array)

# %%
