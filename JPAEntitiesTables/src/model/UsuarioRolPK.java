package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the usuario_rol database table.
 * 
 */
@Embeddable
public class UsuarioRolPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="id_usuario", insertable=false, updatable=false)
	private Integer idUsuario;

	@Column(name="id_rol", insertable=false, updatable=false)
	private Integer idRol;

	public UsuarioRolPK() {
	}
	public Integer getIdUsuario() {
		return this.idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Integer getIdRol() {
		return this.idRol;
	}
	public void setIdRol(Integer idRol) {
		this.idRol = idRol;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof UsuarioRolPK)) {
			return false;
		}
		UsuarioRolPK castOther = (UsuarioRolPK)other;
		return 
			this.idUsuario.equals(castOther.idUsuario)
			&& this.idRol.equals(castOther.idRol);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.idUsuario.hashCode();
		hash = hash * prime + this.idRol.hashCode();
		
		return hash;
	}
}