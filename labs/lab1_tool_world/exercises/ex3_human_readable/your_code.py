import numpy as np
TEACHER_CODE=False
def sort_songs(audio_features):
    """"Receive audio features and sort them according to your criterion"

    Args:
        audio_features (list of dictionaries): List of songs with audio features

    Returns:
        list of dict: the sorted list
    """
    sorted_songs=[]

    # Random shuffle: replace it!
    if TEACHER_CODE:
        random_idxs=np.random.permutation(len(audio_features))
        for idx in random_idxs:
            sorted_songs.append(audio_features[idx])
    else:
        # your code here
        denceability = np.array([af["danceability"] for af in audio_features])
        idx = np.argsort(denceability)
        N_third = int(len(audio_features)/3)
        low_dance_idx = idx[0:N_third]
        mid_dance_idx = idx[N_third: 2*N_third]
        high_dance_idx = idx[N_third*2:]
        sorted_idx = np.stack([mid_dance_idx, high_dance_idx, low_dance_idx[::-1]])
        for idxs in sorted_idx:
            sorted_songs.append(audio_features[idxs])
        
    return sorted_songs