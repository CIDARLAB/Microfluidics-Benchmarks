import matplotlib.pyplot as plt
import numpy as np

def takeFirst(e):
    return e[0]

def takeSecond(e):
    return e[1]

def takeThird(e):
    return e[2]

def takeFourth(e):
    return e[3]

def read_csv(fpath: str):
    DESIGN=np.loadtxt(open(fpath,"rb"),delimiter=",",skiprows=0)
    return DESIGN

def save_csv(DATA, address):
    np.savetxt(address, DATA, delimiter=',')

def read(PATH):
    DATA = np.loadtxt(open(PATH,"rb"),delimiter=",",skiprows=0)
    return DATA

def save(DATA, address):
    np.savetxt(address, DATA, delimiter=',')

def full_permutation(N):
    ANS=1
    for i in range(N):
        ANS*=(i+1)
    return ANS

def combination(N,M):
    return int(full_permutation(N)/(full_permutation(N-M)*full_permutation(M)))

def draw(X,Y,DX,DY):
    linwid=0.5
    # plt.axis("equal")
    plt.plot([X,X+DX],[Y,Y],'b',linewidth=linwid)
    plt.plot([X,X+DX],[Y+DY,Y+DY],'b',linewidth=linwid)    
    plt.plot([X,X],[Y,Y+DY],'b',linewidth=linwid)
    plt.plot([X+DX,X+DX],[Y,Y+DY],'b',linewidth=linwid)   

# def showports(PORT,LOC,TREE):
#     # tree[3] is the rotation
    
def plotdevice(X1,Y1,XSPAN,YSPAN,ROTATION,NAME):
    X=X1
    Y=Y1
    linwid=0.5
    # X=SIZE[0]-X1
    # Y=SIZE[1]-Y1
    match (ROTATION % 360):
        case 0:
            plt.plot([X, X+XSPAN],[Y-YSPAN/2,Y-YSPAN/2],'b',linewidth=linwid)
            plt.plot([X, X+XSPAN],[Y+YSPAN/2,Y+YSPAN/2],'b',linewidth=linwid)
            plt.plot([X, X],[Y-YSPAN/2,Y+YSPAN/2],'b',linewidth=linwid)
            plt.plot([X+XSPAN, X+XSPAN],[Y-YSPAN/2,Y+YSPAN/2],'b',linewidth=linwid)
            plt.plot(X,Y,'go')
            plt.text(X,Y, NAME)
        case 90:
            plt.plot([X,X],[Y, Y+XSPAN],'b',linewidth=linwid)
            plt.plot([X+YSPAN,X+YSPAN],[Y, Y+XSPAN],'b',linewidth=linwid)
            plt.plot([X,X+YSPAN],[Y, Y],'b',linewidth=linwid)
            plt.plot([X,X+YSPAN],[Y+XSPAN, Y+XSPAN],'b',linewidth=linwid)
            plt.plot(X,Y,'go')
            plt.text(X,Y, NAME)
        case 180:
            plt.plot([X, X+XSPAN],[Y-YSPAN/2,Y-YSPAN/2],'b',linewidth=linwid)
            plt.plot([X, X+XSPAN],[Y+YSPAN/2,Y+YSPAN/2],'b',linewidth=linwid)
            plt.plot([X, X],[Y-YSPAN/2,Y+YSPAN/2],'b',linewidth=linwid)
            plt.plot([X+XSPAN, X+XSPAN],[Y-YSPAN/2,Y+YSPAN/2],'b',linewidth=linwid)
            plt.plot(X,Y,'go')
            plt.text(X,Y, NAME)
        case 270:
            plt.plot([X,X],[Y, Y+XSPAN],'b',linewidth=linwid)
            plt.plot([X+YSPAN,X+YSPAN],[Y, Y+XSPAN],'b',linewidth=linwid)
            plt.plot([X,X+YSPAN],[Y, Y],'b',linewidth=linwid)
            plt.plot([X,X+YSPAN],[Y+XSPAN, Y+XSPAN],'b',linewidth=linwid)            
            plt.plot(X,Y,'go')
            plt.text(X,Y, NAME)

def plotport(X_DEVICE1,Y_DEVICE1,X_PORT,Y_PORT,ROTATION,X_SPAN,Y_SPAN,MIRROR):
    # in 3duf
    # X_DEVICE=SIZE[0]-X_DEVICE1
    # Y_DEVICE=SIZE[1]-Y_DEVICE1
    linwid=2
    X_DEVICE=X_DEVICE1
    Y_DEVICE=Y_DEVICE1
    if MIRROR:
        # mirror
        match (ROTATION % 360):
            case 0:
                plt.plot(X_DEVICE+X_SPAN-X_PORT,Y_DEVICE+Y_PORT,'ro',markersize=linwid)

            case 90:
                plt.plot(X_DEVICE+Y_SPAN-Y_PORT,Y_DEVICE+(X_SPAN-X_PORT),'ro',markersize=linwid)

            case 180:
                plt.plot(X_DEVICE+X_PORT,Y_DEVICE+(Y_SPAN-Y_PORT),'ro',markersize=linwid)

            case 270:        
                plt.plot(X_DEVICE+Y_PORT,Y_DEVICE+X_PORT,'ro',markersize=linwid)
       
    else:
        # no mirror
        match (ROTATION % 360):
            case 0:
                plt.plot(X_DEVICE+X_PORT,Y_DEVICE+Y_PORT,'ro',markersize=linwid)

            case 90:
                plt.plot(X_DEVICE+Y_PORT,Y_DEVICE+(X_SPAN-X_PORT),'ro',markersize=linwid)

            case 180:
                plt.plot(X_DEVICE+(X_SPAN-X_PORT),Y_DEVICE+(Y_SPAN-Y_PORT),'ro',markersize=linwid)

            case 270:        
                plt.plot(X_DEVICE+(Y_SPAN-Y_PORT),Y_DEVICE+X_PORT,'ro',markersize=linwid)