import numpy as np
import matplotlib.pyplot as plt

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def rand():
        return Point(*np.random.rand(2))

    def points(self):
        return (self.x, self.y)

class Rect:
    def __init__(self, A, B, rec=0, rec_max=3):
        if A.x > B.x:
            Bx = B.x
            B.x = A.x
            A.x = Bx

        if A.y < B.y:
            Ay = A.y
            A.y = B.y
            B.y = Ay

        self.A = A
        self.B = B
        self.rec = rec
        self.rec_max = rec_max

        assert self.A.x <= self.B.x and self.A.y >= self.B.y

    def unit(rec=0, rec_max=3):
        return Rect(Point(0, 1), Point(1, 0), rec, rec_max)

    def contains_point(self, point):
        return (self.A.x <= point.x <= self.B.x and
                self.B.y <= point.y <= self.A.y)
    
    def contains(self, other):
        return self.contains_point(other.A) and self.contains_point(other.B)

    def contained_by(self, other):
        return other.contains_point(self.A) and other.contains_point(self.B)

    def rand():
        return Rect(Point.rand(), Point.rand())

    def rand_sub(self):
        t = np.random.randint(4)
        p = Point(np.random.uniform(self.A.x, self.B.x),
                  np.random.uniform(self.B.y, self.A.y))
        if t == 0:
            return Rect(self.A, p, self.rec+1, self.rec_max)
        if t == 1:
            return Rect(Point(self.B.x, self.A.y), p, self.rec+1, self.rec_max)
        if t == 2:
            return Rect(p, Point(self.A.x, self.B.y), self.rec+1, self.rec_max)
        if t == 3:
            return Rect(p, self.B, self.rec+1, self.rec_max)

    def centroid(self):
        return Point((self.A.x + self.B.x)/2, (self.A.y + self.B.y)/2)

    def rand_split(self):
        t = np.random.randint(2)
        rec = self.rec + 1
        if t == 0:
            # x = np.random.uniform(self.A.x, self.B.x)
            x = np.random.beta(5, 5) * (self.B.x - self.A.x) + self.A.x
            ra = Rect(self.A, Point(x, self.B.y), self.rec+1, self.rec_max)
            rb = Rect(Point(x, self.A.y), self.B, self.rec+1, self.rec_max)
            return ra, rb
        else:
            # y = np.random.uniform(self.B.y, self.A.y)
            y = np.random.beta(5, 5) * (self.A.y - self.B.y) + self.B.y
            ra = Rect(self.A, Point(self.B.x, y), self.rec+1, self.rec_max)
            rb = Rect(Point(self.A.x, y), self.B, self.rec+1, self.rec_max)
            return ra, rb

    def plot(self, color='black', lw=3):
        plt.plot([self.A.x, self.B.x], [self.A.y, self.A.y], color=color, lw=lw)
        plt.plot([self.A.x, self.B.x], [self.B.y, self.B.y], color=color, lw=lw)
        plt.plot([self.A.x, self.A.x], [self.A.y, self.B.y], color=color, lw=lw)
        plt.plot([self.B.x, self.B.x], [self.A.y, self.B.y], color=color, lw=lw)

        # fill = np.random.choice(['grey', 'yellow', 'red', 'blue'], 
        #                         p=[0.4, 0.2, 0.2, 0.2])
        fill = np.random.choice(['whitesmoke', 'gold', 'red', 'royalblue'], 
                                p=[0.4, 0.2, 0.2, 0.2])
        # fill = np.random.choice(['whitesmoke', 'gold', 'red', 'royalblue', 'darkorange', 'green', 'hotpink'], 
        #                         p=np.ones(7)/7)
        #                         # p=[.4, .1, .1, .1, .1, .1, .1])

        if np.abs(self.A.x - self.B.x) < 0.03 or np.abs(self.A.y - self.B.y) < 0.03:
            fill = "black"

        plt.fill_between([self.A.x, self.B.x],
                         [self.A.y, self.A.y],
                         [self.B.y, self.B.y], color=fill)

def make_mondrian(rs=[Rect.unit()]):
    r = rs[-1]
    if np.exp(r.rec_max - r.rec) > np.random.exponential(0.1):
        ra, rb = r.rand_split()
        return make_mondrian([ra]) + make_mondrian([rb])
    else:
        return rs

if __name__ == '__main__':
    # for i in range(100):
    for i in (15, ):
        np.random.seed(i)
        rs = make_mondrian([Rect.unit(rec_max=.5)])
        print('i: {} | num rects: {}'.format(i, len(rs)))

        j = 0
        for r in rs:
            r.plot(lw=5, color='black')
            c = r.centroid()
            # plt.text(c.x, c.y, j)
            j += 1

        plt.xlim(0, 1)
        plt.ylim(0, 1)
        plt.xticks([])
        plt.yticks([])
        plt.tight_layout()
        # plt.show()
        plt.savefig('mondrian.png')
        plt.close()

