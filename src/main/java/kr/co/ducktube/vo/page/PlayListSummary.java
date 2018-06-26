package kr.co.ducktube.vo.page;

import java.util.List;
import java.util.Map;

import kr.co.ducktube.vo.table.Playlist;
import kr.co.ducktube.vo.table.User;

public class PlayListSummary {
	
	private User user;
	private List<Playlist> playlists;
	private Map<String, Object> conditions;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Playlist> getPlaylists() {
		return playlists;
	}
	public void setPlaylists(List<Playlist> playlists) {
		this.playlists = playlists;
	}
	public Map<String, Object> getConditions() {
		return conditions;
	}
	public void setConditions(Map<String, Object> conditions) {
		this.conditions = conditions;
	}
	@Override
	public String toString() {
		return "PlayListSummary [user=" + user + ", playlists=" + playlists +", conditions="
				+ conditions + "]";
	}
	
	
}