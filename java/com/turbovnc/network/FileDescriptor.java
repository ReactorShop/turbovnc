/* Copyright (C) 2012 Brian P Hinz.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,
 * USA.
 */
package com.turbovnc.network;

import java.io.IOException;
import com.turbovnc.rdr.Exception;

public interface FileDescriptor {
    
  public int read(byte[] buf, int bufPtr, int length) throws Exception;
  public int write(byte[] buf, int bufPtr, int length) throws Exception;
  public int select(int interestOps, int timeout) throws Exception;
  public void close() throws IOException;

}