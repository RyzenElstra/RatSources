package main

import (
	"crypto/rand"
	"encoding/hex"
	"io"
)

func uuid() (string, error) {
	uuid := make([]byte, 16)
	n, err := rand.Read(uuid)
	if n != len(uuid) || err != nil {
		return "", err
	}
	// TODO: verify the two lines implement RFC 4122 correctly
	uuid[8] = 0x80 // variant bits see page 5
	uuid[4] = 0x40 // version 4 Pseudo Random, see page 7

	return hex.EncodeToString(uuid), nil
}

type byteCounter struct {
	Total int64
}

func (b *byteCounter) Write(p []byte) (int, error) {
	b.Total += int64(len(p))
	return len(p), nil
}

func getLength(reader io.ReadSeeker) int64 {
	reader.Seek(0, 0) // reset for new reader
	var counter byteCounter

	t := io.TeeReader(reader, &counter)

	buf := make([]byte, 4096)
	for {
		_, err := t.Read(buf)
		if err != nil {
			break
		}
	}

	reader.Seek(0, 0) // reset
	return counter.Total
}
